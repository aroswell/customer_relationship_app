# This file's sole purpose is to run the main application
# Having a separate file prevents the test suite from triggering a run command within crm.rb

require "pry"
require_relative "../../db/connection"
require_relative 'rolodex'
require_relative "../views/text_formatting"
require_relative 'crm'

CRM.run
