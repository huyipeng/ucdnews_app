class MainPagesController < ApplicationController
  def home
    @journal = Journal.first
    @journaltotal = Journal.count

    if @journal
    	@next = Journal.all.where("id > ?", @journal.id).order("id ASC").first
    	@prev = Journal.all.where("id < ?", @journal.id).order("id DESC").first
    end
  end

  def about
  end
end
