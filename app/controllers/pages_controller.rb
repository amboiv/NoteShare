class PagesController < ApplicationController
  def home
    @notes = Note.all
  end

  def about
  end

  def contact
  end
end
