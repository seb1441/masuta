# frozen_string_literal: true

class LessonsReflex < ApplicationReflex
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com
  # def filter
  #   @lessons = []
  #   @count = []
  # end
  def search
    # session[:query] = element[:value].strip
    table = element.dataset["table"]
    name = element.dataset["name"]
    if table.present?
      session["#{table}___#{name}".to_sym] = element[:value].strip
    else
      session[name.to_sym] = element[:value].strip
    end
  end

  def order
    session[:order_by] = element.dataset["column-name"]
    session[:direction] = element.dataset["direction"]
  end

  def paginate
    session[:page] = element.dataset[:page].to_i
  end
end
