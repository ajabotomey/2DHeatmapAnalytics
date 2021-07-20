class TutorialLevelController < LevelController

    def upload_data

        # Open the Master File and convert to a hash
        #masterFileName = Rails.root.join("public", "/level_files/tutorial_master.json")
        #puts Rails.root
        #puts masterFileName

        masterFileName = Rails.root.join("public", "level_files", "tutorial_master.json")

        masterFile = File.read(masterFileName) 
        masterData = JSON.parse(masterFile)

        newData = get_parsed_body

        newData['positions'].each do |newPosition|
            matchFound = false

            masterData['positions'].each do |masterPosition|
                if masterPosition['x'].to_i == newPosition['x'].to_i && masterPosition['y'].to_i == newPosition['y'].to_i
                    masterPosition['count'] = masterPosition['count'].to_i + 1
                    matchFound = true
                end
            end

            if matchFound == false
                masterData['positions'].push({'x' => newPosition['x'], 'y' => newPosition['y'], 'count' => 1})
            end
        end

        File.write(masterFileName, JSON.pretty_generate(masterData))

    end

    def download_data
        # Retrieve the JSON file
        masterFileName = Rails.root.join("public", "level_files", "tutorial_master.json")
        masterFile = File.read(masterFileName)
        masterData = JSON.parse(masterFile)

        puts masterData

        render :json => masterData

        # Render the file
    end

end