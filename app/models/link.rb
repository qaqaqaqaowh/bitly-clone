class Link < ActiveRecord::Base
	validates :link, uniqueness: true
	validates :link, format: {with: (URI::regexp(['http','https'])), message: "invalid url"}
	validates :encrypt, uniqueness: true
end