# == Schema Information
#
# Table name: seasons
#
#  id          :integer          not null, primary key
#  name        :string(510)      not null
#  created_at  :datetime
#  updated_at  :datetime
#  sort_number :integer          not null
#  year        :integer          not null
#
# Indexes
#
#  index_seasons_on_sort_number    (sort_number) UNIQUE
#  index_seasons_on_year           (year)
#  index_seasons_on_year_and_name  (year,name) UNIQUE
#

class Season < ActiveRecord::Base
  has_many :works

  delegate :yearly_season_ja, to: :decorate

  def self.find_by_slug(slug)
    year, name = slug.split("-")
    find_by(year: year, name: name)
  end

  def slug
    "#{year}-#{name}"
  end
end
