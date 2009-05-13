class Result < ActiveRecord::Base
  belongs_to :user
  before_save :calc_total

  INTERPRETATIONS=[[5,"not depressed"],
                   [10,"normal but unhappy"],
                   [25,"mild depression"],
                   [50,"moderate depression"],
                   [75,"severe depression"],
                   [100,"extreme depression"]]

  serialize :resulthash
  # Need to set up so that all questions have an answer slot and that
  def validate
    (1..25).each do |i|
      if resulthash["ans"+i.to_s].blank?
        self.errors.add_to_base "Question ##{i} cannot be left blank."
      end
    end
    super
  end

  def calc_total
    tot = 0
    (1..25).each do |i|
      tot += resulthash["ans"+i.to_s].to_i
    end
    self.total = tot
  end

  def interpret
    return nil if total.nil?
    INTERPRETATIONS.each do |top,res|
      if total <= top
        return res
      end
    end
  end
end
