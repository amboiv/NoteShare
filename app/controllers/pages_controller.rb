class PagesController < ApplicationController
  def home
    @notes = Note.all
    @courses = Course.all
  end

  def about
  end

  def contact
  end
end
