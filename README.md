# Twitter DB

*The Dumbest Thing I've Ever Done*

Use a private Twitter account for your database. I mean don't. But this will let you
do it. Kind of!

## Usage (don't)

This doesn't even really work. Look at the source for a thing that kind of works. Also
don't use this because you'll get your twitter account taken away from you and no one 
wants that.

    client = TwitterDB::Client.new
    
    # Save something
    id = client.insert "Sup y'all"
    
    # Get something
    text = client.get id
    
    # Delete something
    client.delete id

That's all for now.
