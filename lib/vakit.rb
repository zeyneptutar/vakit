require 'vakit/version'
require 'vakit/connect'
require 'vakit/vakit_log'
require 'nokogiri'
require 'open-uri'
require 'time_diff'

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


  def self.kerahat?

    now_date = Time.now
    parsed_sabah = Time.parse(self.sabah)
    parsed_oglen = Time.parse(self.oglen)
    parsed_aksam = Time.parse(self.aksam)

    kerahat_sabah = parsed_sabah + 45*60
    kerahat_oglen = parsed_oglen - 45*60
    kerahat_aksam = parsed_aksam - 45*60

    if (parsed_sabah < now_date && kerahat_sabah > now_date)
      puts "Sabah kerahat vakti. Saat = #{now_date.strftime("%I:%M %p") }"
    elsif (parsed_oglen > now_date && kerahat_oglen < now_date)
      puts "Oglen kerahat vakti. Saat = #{now_date.strftime("%I:%M %p") }"
    elsif (parsed_aksam > now_date && kerahat_aksam < now_date)
      puts "Aksam kerahat vakti. Saat = #{now_date.strftime("%I:%M %p") }"
    else 

      prayer = self.get_which_prayers
      next_kerahat = ""

      if (prayer != nil)
        
        if (prayer.to_s == "imsak")
          remaining = Time.diff(now_date, parsed_sabah  , '%h saat - %m dak ')[:diff]
          next_kerahat = "sabah"

        elsif (prayer.to_s == "sabah")
          remaining = Time.diff(now_date, kerahat_oglen  , '%h saat - %m dak ')[:diff]
          next_kerahat = "oglen"

        elsif (prayer.to_s == "oglen"  || prayer.to_s == "ikindi"  )
          remaining = Time.diff(now_date, kerahat_aksam  , '%h saat - %m dak ')[:diff]
          next_kerahat = "ikindi"

        elsif (prayer.to_s == "aksam" || prayer.to_s == "yatsi" )
          remaining = Time.diff(now_date, parsed_sabah  , '%h saat - %m dak ')[:diff]
          next_kerahat = "sabah"

        end

      end
        
      puts "Kerahat vakti degil. Saat  #{now_date.strftime("%I:%M %p") }. #{next_kerahat} Kerahat vaktine kalan süre = #{remaining}"

    end

  end


  def self.get_which_prayers

      now_date = Time.now
      hash_prayers = Vakit::Connect.shaber
      parsed_imsak = Time.parse( hash_prayers[:imsak] )
      parsed_sabah = Time.parse( hash_prayers[:sabah] )
      parsed_oglen = Time.parse( hash_prayers[:oglen] )
      parsed_ikindi = Time.parse( hash_prayers[:ikindi])
      parsed_aksam = Time.parse( hash_prayers[:aksam])
      parsed_yatsi= Time.parse( hash_prayers[:yatsi] )

      vakit_arr = [parsed_imsak,parsed_sabah,parsed_oglen,parsed_ikindi,parsed_aksam,parsed_yatsi]
      time_current_arr = ["imsak" ,"sabah" , "oglen" ,"ikindi" , "aksam" , "yatsi" , "imsak"]

      k = 0
      time_current = []
      5.times do |v|
        if (vakit_arr[k] < now_date &&  vakit_arr[k+1] > now_date)
         return time_current = time_current_arr[k]
        end
        k = k + 1
      end

      retun nil
  end


end
