module Recruiter
  class ArticleDecorator < Draper::Decorator
    delegate_all

    include Recruiter::DecoratorHelper
    include Recruiter::PublicableDecoratorHelper

    def published?
      decorate_boolean(object.published?)
    end
  end
end
