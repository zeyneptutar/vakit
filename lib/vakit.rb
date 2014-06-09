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

  def self.vakit?
      time=Time.now
      Connect.shaber.each_cons(2) do  |(k,v),(k2,v2)| 
        if (time - Time.parse(v)) > 0 && (time - Time.parse(v2)) < 0
          return "Su an #{k} vaktindeyiz. #{k2} vaktine kalan sure #{Time.diff(time,Time.parse(v2),'%h:%m')[:diff]}"
        end
         LOGGER.info("Namaz vakti sorgulandi")
      end
       
  end


  def self.hatirlat(email)
    options = { :address        => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'z.tutar@gmail.com',
            :user_name            => 'z.tutar',
            :password             => '_________',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

    Mail.defaults do 
      delivery_method :smtp, options
    end

    Mail.deliver do
        to  email
        from 'z.tutar@gmail.com'
       subject 'namaz vakti hatirlatma servisi'
       body   Vakit::vakit?
    end 

     LOGGER.info("#{email} adresine vakit hatirlatma maili gonderildi")  
  
  end

end
