require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      select
        *
      from
        #{self.table_name}
    SQL
    cols.map!(&:to_sym)
    @columns = cols
  end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do
        self.attributes[name]
      end

      define_method("#{name}=") do |arg|
        self.attributes[name] = arg
      end

    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
    select
      *
    from
      #{table_name}
    SQL
    parse_all(results)
  end

  def self.parse_all(results)
    results.map do |hash|
      self.new(hash)
    end
  end

  def self.find(id)
    ids = DBConnection.execute(<<-SQL, id)
      select
        *
      from
        #{table_name}
      where
        #{table_name}.id = ?
    SQL
    parse_all(ids).first
  end

  def initialize(params = {})
    params.each do |k,v|
      check = k.to_sym
      raise "unknown attribute '#{k}'" unless self.class.columns.include?(check)
      self.send("#{k}=", v)

    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    id.nil? ? insert : update
  end
end
