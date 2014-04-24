class StyleguideController < ApplicationController

  def index
  end

  def globals
    @styleguide = Kss::Parser.new("app/assets/stylesheets/globals")
    @in_styleguide = true
  end

  def objects
    @styleguide = Kss::Parser.new("app/assets/stylesheets/objects")
    @in_styleguide = true
  end

  def modules
    @styleguide = Kss::Parser.new("app/assets/stylesheets/modules")
    @in_styleguide = true
  end

  def layouts
    @styleguide = Kss::Parser.new("app/assets/stylesheets/layouts")
    @in_styleguide = true
  end

end
