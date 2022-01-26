require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize  
        super('users.db')
        self.type_translation = true 
        self.results_as_hash = true 
    end
end

class Users
    attr_accessor :id, :fname, :lname
    self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless user.length > 0

        Users.new(user.first)
    end

    # self.find_by_name(fname, lname)

    # # end

    def initialize(options)
        @id = options["id"]
        @fname = options["fname"]
        @lname = options["lname"]
    end
end


class Questions
    attr_accessor :id, :title, :body, :author_id  
    self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions 
            WHERE
                id = ?
        SQL
        return nil unless question.length > 0

        Questions.new(question.first)
    end

    def initialize(options)
        @id = options["id"]
        @title = options["title"]
        @body = options["body"]
        @author_id = options["author_id"]
    end
end


class QuestionFollows
    attr_accessor :id, :users_id, :questions_id
    self.find_by_id(id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        return nil unless question_follow.length > 0

        QuestionFollows.new(question_follow.first)
    end

    def initialize(options)
        @id = options["id"]
        @users_id = options["users_id"]
        @questions_id = options["questions_id"]
    end
end


class Replies 
    attr_accessor :id, :question_id, :parent_id, :user_id, :body
    self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies 
            WHERE
                id = ?
        SQL
        return nil unless reply.length > 0

        Replies.new(reply.first)
    end

    def initialize(options)
        @id = options["id"]
        @question_id = options["question_id"]
        @parent_id= options["parent_id"]
        @user_id = options["user_id"]
        @body = options["body"]
    end
end


class QuestionsLikes 
    attr_accessor :id, :question_id, :user_id
    self.find_by_id(id)
        question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions_likes
            WHERE
                id = ?
        SQL
        return nil unless question_like.length > 0

        QuestionsLikes.new(question_like.first)
    end

    def initialize(options)
        @id = options["id"]
        @question_id = options["question_id"]
        @user_id = options["user_id"]
    end
end