def all_words_capitalized?(arry)
    arry.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    endings  = [".com", ".net", ".io", ".org"]

    urls.none? do |url|
        endings.any? { |ending| url.end_with?(ending)}
    end
end


def any_passing_students?(arry)
    arry.any? do |hash|
        average = hash[:grades].sum(0.0)/hash[:grades].size
        average > 74
    end
end