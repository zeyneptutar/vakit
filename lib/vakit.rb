require 'vakit/version'
require 'vakit/connect'
require 'vakit/vakit_log'
require 'nokogiri'
require 'open-uri'

module Vakit

  LOGGER = Vakit::VakitLog
  
  def self.today
    LOGGER.info("Gunluk namaz vakitleri goruntulendi ")
    Vakit::Connect.shaber

  end

  def self.imsak
    LOGGER.info("Imsak vakti goruntulendi")
    Vakit::Connect.shaber[:imsak]
  end

  def self.sabah
     LOGGER.info("Sabah vakti goruntulendi")
     Vakit::Connect.shaber[:sabah]
  end

  def self.oglen
     LOGGER.info("Oglen vakti goruntulendi")
     Vakit::Connect.shaber[:oglen]
  end

  def self.ikindi
     LOGGER.info("Ikindi vakti goruntulendi")
     Vakit::Connect.shaber[:ikindi]
  end

  def self.aksam
     LOGGER.info("Aksam vakti goruntulendi")
     Vakit::Connect.shaber[:aksam]
  end

  def self.yatsi
     LOGGER.info("Yatsi vakti goruntulendi")
     Vakit::Connect.shaber[:yatsi]
  end

end
