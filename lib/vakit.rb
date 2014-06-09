require 'vakit/version'
require 'vakit/connect'
require 'vakit/vakit_log'
require 'nokogiri'
require 'open-uri'

module Vakit

  LOGGER = Vakit::VakitLog
  
  def self.today
    LOGGER.info(" #{Vakit::Connect.shaber}\nGunluk namaz vakitleri goruntulendi ")
  end

  def self.imsak
    LOGGER.info("#{Vakit::Connect.shaber[:imsak]}\nImsak vakti goruntulendi")
  end

  def self.sabah
     LOGGER.info("#{Vakit::Connect.shaber[:sabah]} \nSabah vakti goruntulendi")
  end

  def self.oglen
     LOGGER.info("#{Vakit::Connect.shaber[:oglen]}\nOglen vakti goruntulendi")
  end

  def self.ikindi
     LOGGER.info("#{Vakit::Connect.shaber[:ikindi]}\nIkindi vakti goruntulendi")
  end

  def self.aksam
     LOGGER.info("#{Vakit::Connect.shaber[:aksam]}\nAksam vakti goruntulendi")
  end

  def self.yatsi
     LOGGER.info("#{Vakit::Connect.shaber[:yatsi]}\nYatsi vakti goruntulendi")
  end

end
