class HomeController < ApplicationController
  def index
    render text: "hello", layout: true
  end
end
