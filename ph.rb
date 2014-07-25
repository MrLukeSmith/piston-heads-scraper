require "selenium-webdriver"

details = Hash.new
details[:registration] = ARGV.first

URL = "http://www.pistonheads.com/selfservice/writeaddetail?categoryname=used-cars&vrm=#{ details[:registration] }&tab=private"

fields = [
          {:field => "PostModel.Specs.SelectedYear", :type => "select", :name => "year"},
          {:field => "PostModel.SelectedMakeId", :type => "select", :name => "make"},
          {:field => "PostModel.SelectedModelId", :type => "select", :name => "model"},
          {:field => "PostModel.Headline", :name => "description"},
          {:field => "PostModel.Specs.SelectedCarType", :type => "select", :name => "type"},
          {:field => "PostModel.Specs.SelectedNumberOfDoors", :type => "select", :name => "doors"},
          {:field => "PostModel.Specs.SelectedBodyColour", :type => "select", :name => "colour"},
          {:field => "PostModel.Specs.SelectedTransmissionType", :type => "select", :name => "transmission"},
          {:field => "PostModel.Options.SelectedEnginePosition", :type => "select", :name => "engine_position"},
          {:field => "PostModel.Options.SelectedAspiration", :type => "select", :name => "aspiration"},
          {:field => "PostModel.Options.EngineSize", :type => "select", :name => "engine_size"},
          {:field => "PostModel.Options.SelectedNumberOfCylinders", :type => "select", :name => "cyclinders"},
          {:field => "PostModel.Options.FuelConsumption", :name => "mpg"},
          {:field => "PostModel.Options.Torque", :name => "torque"},
          {:field => "PostModel.Options.EnginePower", :name => "bhp"},
          {:field => "PostModel.Options.Acceleration0To62", :name => "0to62"},
          {:field => "PostModel.Options.TopSpeed", :name => "top_speed"},
          {:field => "PostModel.Options.SelectedDriveTrain", :type => "select", :name => "drivetrain"},
          {:field => "PostModel.Options.SelectedPreviousOwners", :type => "select", :name => "previous_owners"},
        ]

driver = Selenium::WebDriver.for :firefox
driver.navigate.to URL

fields.each do |f|

  if f[:type] == "select"

    select = driver.find_element(:name, f[:field])
    select_options = select.find_elements(:tag_name, "option")
    select_options.each do |option|
      if option.attribute("selected")
        details[f[:name]] = option.attribute("text")
      end
    end

  else
   
    input = driver.find_element(:name, f[:field])
    details[f[:name]] = input.attribute("value")

  end


end

puts details.to_json

driver.quit