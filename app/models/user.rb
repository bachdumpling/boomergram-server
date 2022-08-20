class User < ApplicationRecord
    has_many :follower_follows, foreign_key: :followee_id, class_name: "Relationship" 
    # source: :follower matches with the belong_to :follower identification in the Follow model 
    has_many :followers, through: :follower_follows, source: :follower
    # followee_follows "names" the Follow join table for accessing through the followee association
    has_many :followee_follows, foreign_key: :follower_id, class_name: "Relationship"    
    # source: :followee matches with the belong_to :followee identification in the Follow model   
    has_many :followees, through: :followee_follows, source: :followee
    
    has_many :posts
    has_many :comments
    has_many :likes
    has_secure_password

    validates :username, presence: true, uniqueness: { case_sensitive: false}
    validates :password, presence: true, allow_nil: true

    def following_count
        followee_follows.length
    end

    def follower_count
        follower_follows.length
    end

    def post_count
        posts.length
    end

    def following_id
        x =[]
        followees.each do |f|
            x.push(f.id)
        end
        x
    end
end