class ShortUrl < ActiveRecord::Base
  MAX_LENGTH = 20
  MIN_LENGTH = 5
  DEFAULT_LENGTH = 6
  
  validates_presence_of :long_url
  validates_length_of :url_hash, :in => MIN_LENGTH..MAX_LENGTH, :too_long => "more than {{count}} characters long", :too_short => "must have at least #{MIN_LENGTH} characters"
  validates_uniqueness_of :url_hash
  validates_presence_of :url_hash
  
  scope :first_by_hash, lambda { |u| where( :url_hash => u ) }
  
  before_validation :set_url_hash
  def set_url_hash( len = DEFAULT_LENGTH )
    self.url_hash = len.times.inject("") do |s,e| 
      s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr 
    end unless self.url_hash
  end
  
  before_validation :set_host
  def set_host
    self.host = APP_CONFIG['host']
  end
  
  ### CLASS Methods ###
  class << self
    def by_hash(hash)
      first_by_hash(hash).first
    end
    
    def url_by_hash(hash)
      tmp = by_hash(hash)
      tmp.blank? ? nil : tmp.long_url
    end
    
    def hash_available?( hash )
      by_hash(hash).blank?
    end
  end
  ### END CLASS Methods ###
end
