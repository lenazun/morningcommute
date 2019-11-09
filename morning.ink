
VAR weather = ""
~ weather = "{~sunny|cloudy|rainy}" 

LIST wearing = dress, pants, sweats 

LIST events = snoozed, lookedPhone, stretched, hadBreakfast, talkedToMatt, walkedToTrain

LIST bag = (laptop), fruit, (sketchBook), umbrella, keys, book

-> WakeUp

=== WakeUp ===
BEEP BEEP BEEP BEEP BEEP BEEP!!

Ughh. It's the alarm clock. 
You look at the old radio clock you've had since the 1990s, as if it was the first time you've seen it.  It's 7am.
-> SnoozeIt

= SnoozeIt
BEEP BEEP BEEP BEEP BEEP BEEP!!

    * [Snooze. It's too early for this life. You've got time.]
        You feel like only a second has passed.
        ~ events += snoozed
        -> SnoozeIt
    * [Deactivate this bomb, and get up.]

-  Not bad, you think, 7:30am. Dante, your dog, is still curled up on his own bed.

-> GetOutOfBed


=== GetOutOfBed ===

The phone, still stuck to its charger, has fallen on the floor somehow, but the glass of water you keep next to it is intact. Inexplicable.

You look phone and see you got 5 favorites on las night's tweet. There's 2 new emails on your personal account. A couple of direct messages on Instagram. All very tempting.

    * You stay in bed looking at your phone for a bit.
        ~ events += lookedPhone
        It's supposed to be {weather} today, but in this city you never know. 
        LOL that's a funny tweet. Fav.
        Cute puppy. Love.
        A meeting to review the report at noon. Oh oh. Better go now.
    * You put the phone aside and get to the business of getting out of bed.
        ~ events -= lookedPhone

- But first you have to stretch a little. Over the last couple of years you've realize spending 10 mins stretching in the morning has improved all the body aches your body has mysteriously acquired.

    * [Stretch.] 
    You go over your stretch routine. A few cat-cows, a couple of downward dogs. Dante wakes up and stretches with you, with his own moves. This is totally worth it. 
        ~ events += stretched
    * [Nah, get up inmediately, no time for that today.] 
        ~ events -= stretched

- It's time to get ready.

-> GetReady

=== GetReady ===

You take a shower and put some sunscreen on your face. Fix your hair a little. Some makeup.

You have narrowed down your outfit choices for the office but still, there's a moment of decision making here you haven't been able to pair down. 

    * You decide to wear black pants and a blue shirt. Simple, basic, comfortable.
        ~ wearing += pants
    * You decide to wear a colorful dress and tights. You don't mind getting a bit more attention, a compliment here and there.
        ~ wearing += dress
    * You'll wear sweatpants to the office, but like, "fancy sweatpants". No one will notice.
        ~ wearing += sweats

- You go to the kitchen and prepare some coffee. Is there time for breakfast?

    * [Always.]
    You prepare some toast and find a podcast to listen to. There's this 14 part real-life mystery you've been meaning to hear. You listen while you eat and put some food on Dante's plate.
        ~ events += hadBreakfast
    
    * [Not today.] 
       Ugh. It feels like you're running late already. You hurry to put some food on Dante's plate, he always has to eat even if you don't. 
    
- It's now time to prepare your bag for the day ahead.    

-> Bag

=== Bag ===

You have a backpack, a comfy one but not too big.
You need your laptop obviously, and your sketchbook never leaves your bag. 

You have room for one more thing. You choose:

    * Fruit, you'll get hungry
    ~ bag += fruit
    * An umbrella
    ~ bag += umbrella
    * A book
    ~ bag += book 

- Ok that seems to be enough. Now let's get Dante on his leash.

-> DogWalk

=== DogWalk ===

You leave the house and double check you have keys and wallet. Sometimes you forget and have to come back, infinitely annoyed at yourself.

Everything is in place. It really is a {weather} day. 

{ bag ? umbrella && weather == "rainy": Luckily you're carrying an umbrella, nothing to worry about.}
{ bag !? umbrella && weather == "rainy": You didn't bring the umbrella, you'll have to run!}
{ wearing != dress && weather == "sunny": You should have worn that dress, but it's too late now.}

Dante stays with your friend Matt, who works from home and has a similar sized dog named Millie. 

Matt lives only a couple of blocks away and likes having the dogs around and taking them for walks around the neighborhood. He sends photos of Dante and Millie napping, playing with a stuffed pizza slice, or running around his apartment.

    {LIST_COUNT(events) > 3: It's starting to get late...}

Matt seems to be a little sad today. You say: 

    * Hey man, what's up?
        -> mattConversation ->
        ~ events += talkedToMatt
    * Hey Matt, here's the little monkey. Hope he doesn't give you much trouble! 

- You say goodbye to Millie, Dante and Matt. A silly, beautiful part of your family.

-> GetOnTransport


=== GetOnTransport ===

You walk a couple of blocks to the main intersection. The screen on the bus stop says the next one will take 15 minutes.

    {LIST_COUNT(events) > 4: You're really late now...}

    * "Nonsense". You decide to walk.
    The train station is only a few blocks away. { bag !? umbrella && weather == "rainy": You get soaked but it doesn't matter, it's just water, right? }
        ~ events += walkedToTrain
    * "I'll wait. I can catch up on my reading." 
    { bag ? book: You're reading a book about a famous museum heist. You can't get enough of this story, it has it all. You're so into it you almost miss the bus when it finally arrives, and almost miss your stop when you're supposed to get off! }
    { bag !? book: Ugh you didn't bring your book. It's ok, you catch up on social media. You hate yourself a little. The bus comes and you try to pay attention to other people on the bus, make stories about them in your head.}

- You're finally at the train station.

While you're waiting on the platform, you think of your friend Matt. He's such a good guy!

{ events !? talkedToMatt: You decide to text him. -> mattConversation ->}

The train arrives. It's packed! You squeeze in and try to make yourself smaller. It's only three stations, you can do this.

-> Arrive

=== Arrive ===

After a few minutes on the train you emerge to the surface and walk to your office building.

You say hello to Josh at the front desk. "What's up Josh?" He smiles and waves. {LIST_COUNT(events) > 4: You hate being this late, but you're not in trouble.}{LIST_COUNT(events) < 3: It's quite early, in retrospect, there was nothing to worry about.}

You get to your desk but before you get into your emails you look out the window, at the beautiful city outside {weather == "rainy": ,the sun is starting to come out}, you see the waves of commuters running to their own lives.

We'll do it all over again tomorrow.

-> END

=== mattConversation ===

        Matt says things are not going so well with his boyfriend. He's thinking of breaking up with him. 
        - "Oh no, I'm sorry.  Do you want to talk more about it this evening when I come back for Dante?"
        He says he's OK but he'd love to have coffee and catch up. 
        "I'll be here at 6!". 
        
        ->->



