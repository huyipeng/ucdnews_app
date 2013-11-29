class MainPagesController < ApplicationController
  def home
    @journal = Journal.last
    @journaltotal = Journal.count

    @next = Journal.all.where("id > ?", @journal.id).order("id ASC").first
    @prev = Journal.all.where("id < ?", @journal.id).order("id DESC").first
  end

  def about
  end
end
