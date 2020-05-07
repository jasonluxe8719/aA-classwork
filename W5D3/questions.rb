require 'sqlite3'
require 'singleton'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end

end

class User
    attr_accessor :id, :fname, :lname
    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            * 
        FROM
            users
        WHERE
            id = ?
    SQL

    return nil unless id > 0

    User.new(user.first)
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            * 
        FROM
            users
        WHERE
            fname = ? AND lname = ?
    SQL

    return nil unless fname.length > 0 ||  lname.length > 0

    User.new(user.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def authored_questions
        Question.find_by_author_id(id)
    end

    def authored_replies
        Reply.find_by_user_id(id)
    end

    def followed_questions 
        QuestionFollow.followed_questions_for_author_id(id)
    end
end

class Question 
    attr_accessor :title, :author_id, :body, :id
    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            * 
        FROM
            questions
        WHERE
            id = ?
    SQL
    
    return nil unless id > 0

    Question.new(question.first)
    end

    def self.find_by_author_id(author_id)
        question = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE
            author_id = ?
    SQL

    return nil unless author_id > 0

    Question.new(question.first)
    end

    def self.find_by_body(body)
        question = QuestionsDatabase.instance.execute(<<-SQL, body)
        SELECT
            *
        FROM
            questions
        WHERE
            body = ?
    SQL

    return nil unless body.length > 0 

    Question.new(question.first)
    end

    def self.find_by_title(title)
        question = QuestionsDatabase.instance.execute(<<-SQL, title)
        SELECT
            *
        FROM
            questions
        WHERE
            title = ?
    SQL

    return nil unless title.length > 0

    Question.new(question.first)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def author
        User.find_by_id(id)
    end

    def replies
        Reply.find_by_question_id(id)
    end

    def followers
        QuestionFollow.followers_for_question_id(author_id)
    end
end

class QuestionFollow
    attr_accessor :id, :question_id, :user_id
    def self.find_by_id(id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            * 
        FROM
            question_follows
        WHERE
            id = ?
    SQL
    
    return nil unless id > 0

    QuestionFollow.new(question_follows.first)
    end

    def self.find_by_question_id(question_id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            * 
        FROM
            question_follows
        WHERE
            question_id = ?
    SQL
    
    return nil unless question_id > 0

    QuestionFollow.new(question_follow.first)
    end

    def self.find_by_user_id(user_id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            * 
        FROM
            question_follows
        WHERE
            user_id = ?
    SQL
    
    return nil unless user_id > 0

    QuestionFollow.new(question_follow.first)
    end

    def self.followers_for_question_id(question_id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            * 
        FROM
            users
        JOIN
            question_follows ON users.id = question_follows.user_id
        WHERE
            question_follows.question_id = ?
    SQL
    return nil unless question_id > 0

    QuestionFollow.new(question_follow.first)
    end

    def self.followed_questions_for_author_id(author_id)
        question_follow = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        JOIN
            question_follows ON questions.author_id = question_follows.user_id
        WHERE
            question_follows.user_id = ?
    SQL
    
    return nil unless user_id > 0

    QuestionFollow.new(question_follow.first)
    end


    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

end

class Reply
    attr_accessor :id, :question_id, :parent_reply_id, :author_id, :body

    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            * 
        FROM
            replies
        WHERE
            id = ?
    SQL

    return nil unless id > 0
    Reply.new(reply.first)
    end

    def self.find_by_question_id(question_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            * 
        FROM
            replies
        WHERE
            question_id = ?
    SQL
    
    return nil unless question_id > 0

    Reply.new(reply.first)
    end

    def self.find_by_parent_reply_id(parent_reply_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id)
        SELECT
            * 
        FROM
            replies
        WHERE
            parent_reply_id = ?
    SQL
    
    return nil unless parent_reply_id || parent_reply_id > 0

    Reply.new(reply.first)
    end

    def self.find_by_author_id(author_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            * 
        FROM
            replies
        WHERE
            author_id = ?
    SQL
    
    return nil unless author_id > 0

    Reply.new(reply.first)
    end

    def self.find_by_body(body)
        reply = QuestionsDatabase.instance.execute(<<-SQL,body)
        SELECT
            * 
        FROM
            replies
        WHERE
            body = ?
    SQL
    
    return nil unless body.length > 0

    Reply.new(reply.first)
    end 

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @author_id = options['author_id']
        @body = options['body']
    end

    def author
        User.find_by_id(author_id)
    end

    def question
        Question.find_by_id(question_id)
    end

    def parent_reply
        Reply.find_by_id(parent_reply_id)
    end

    def child_replies
        Reply.find_by_parent_reply_id(id)
    end
end

class QuestionLike
    attr_accessor :id, :question_id, :user_id

     def self.find_by_id(id)
        question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            * 
        FROM
            question_likes
        WHERE
            id = ?
    SQL

    return nil unless id > 0
    QuestionLike.new(question_like.first)
    end

    def self.find_by_question_id(question_id)
        question_like = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT
            * 
        FROM
            question_likes
        WHERE
            question_id = ?
    SQL
    
    return nil unless question_id > 0

    QuestionLike.new(question_like.first)
    end


    def self.find_by_user_id(user_id)
        question_like = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT
            * 
        FROM
            question_likes
        WHERE
            user_id = ?
    SQL
    
    return nil unless user_id > 0

    QuestionLike.new(question_like.first)
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end
end