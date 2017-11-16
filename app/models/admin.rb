class Admin < ApplicationRecord
  attr_accessor :form_type

  validates :name, length: { minimum: 2 }, :if => :register_form
  validates :title, presence: true, :if => :wedding_form
  validates :venue, presence: true, :if => :wedding_form
  validates :time, presence: true, :if => :wedding_form
  validates :date,  inclusion: { in: (Date.today..Date.today+5.years) }, :if => :wedding_form
  validates :num_tables, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50}, :if => :wedding_form
  validates :num_seats, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 25}, :if => :wedding_form

  def register_form
    form_type == "register"
  end

  def wedding_form
    form_type == "wedding"
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #take out those not needed or wanted.
  has_many :guests
end
