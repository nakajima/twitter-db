# Twitter DB

*The Dumbest Thing I've Ever Done*

## Usage (don't)

    client = TwitterDB::Client.new
    
    # Save something
    id = client.insert "Sup y'all"
    
    # Get something
    text = client.get id
    
    # Delete something
    client.delete id

That's all for now.