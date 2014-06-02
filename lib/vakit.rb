require "vakit/version"
require 'vakit/connect'
require 'nokogiri'
require 'open-uri'

module Vakit
  
  def self.today
  	Vakit::Connect.shaber
  end

  def self.imsak
  	Vakit::Connect.shaber[:imsak]
  end

  def self.sabah
  	Vakit::Connect.shaber[:sabah]
  end

  def self.oglen
  	Vakit::Connect.shaber[:oglen]
  end

  def self.ikindi
  	Vakit::Connect.shaber[:ikindi]
  end

  def self.aksam
  	Vakit::Connect.shaber[:aksam]
  end

  def self.yatsi
  	Vakit::Connect.shaber[:yatsi]
  end

  def self.vakit?
    time=Time.now
    Connect.shaber.each_cons(2) do  |(k,v),(k2,v2)| 
    if (time - Time.parse(v)) > 0 && (time - Time.parse(v2)) < 0
      return "Su an #{k} vaktindeyiz. #{k2} vaktine kalan sure #{Time.diff(time,Time.parse(v2),'%h:%m')[:diff]}"
     
    end
  end
end

  def self.hatirlat(email)

    options = { :address        => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'z.tutar@gmail.com',
            :user_name            => 'z.tutar',
            :password             => '@123955857@',
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

    end
end
