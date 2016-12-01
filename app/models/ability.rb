class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.is_admin?
      can :manage, :all
    else
      can :read, Post
      can :create, Post
      can :update, Post do |post|
      	post.try(:user) == user
      end
      can :destroy, Post do |post|
      	post.try(:user) == user
      end
      can :create, Comment
      can :destroy, Comment do |post|
      	post.try(:user) == user
      end
  end
end
