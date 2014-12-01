# Review

## Tests

YOUR TESTING IS BANANAS

BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

"There's always money in the BANANAS TESTING stand."

That testing is so bananas, given that we're in New York City, I expect King
Kong to come up the side of this building and go

"Whut?  I thought there were bananas up here, but it was just a BANANAS test
suite."

So bananas.

## /vendor

Nice use of /vendor

## assets/data_files

I really like this thing and I would like to hear more about it.  Did you
download this?  Build it yourself?  Seems cool.  Probably part of the
presentation.

## JavaScript

You're basically writing jQuery.  This is not a horrible thing, lots of sites
have been built where the only use of jQuery is really to do some eventing.
You're in good company.  That said, you're not reaching for any of the learning
opprotunity in terms of trying to port an OO or MVC concept to JS.  Also, no JS
testing (as expected for the use you have).  Think about if there are
opportunities to explore here.

## Rails Views

Possibly the most complex I have ever seen.  You are using partials
**extensively**.  I think you're probably outside the boundaries of what most
professional settings will ever do with partials.  I think you're missing some
of the beauty of Rails in that you don't have to specify every tiny detail.  In
your case, due to the partials and the locals, you're often having to define
things that Rails would supply for free.  While functionally the same, it would
probably raise an interviewer's eyebrows as being over-engineered.

Take a look at ItinerariesController#index

You're defining two locals which are the same as two instance variables you
just defined.  That's totally unnecessary work.  I think you repeat this
pattern elsewhere several times and I think you're making more work and more
visually "busy" work than you need.

Further, your use of `locals` implies to me that you should probably be using
the `object:` parameter for partials more freely if you're going for having
these super-generic partials.  It looks odd and I'd recommend cleanup and
reduction in the partial count.  DRY is nice, but if you do it too much you
might CHAFE.

## Models

You have a lot of models, I wonder if that complexity is required.  A
travel_date is defined and belongs to an Itinerary but isn't used as such as
far as I can tell.

## Controllers

There's a lot to talk about here...

* `respond_to` not needed in many places
* `set_alert` method, why?
* private controller methods: it's weird to me that you have several one-liner
  helper methods where the implementation would be sufficient e.g.
  `find_itinerary`: what's wrong with inlining that code where used?  It feels
  like a premature optimization

## Locations

I don't feel like this should be publicly exposed i.e. `locations/new` or
PUT/PATCH `locations/id`.  Did you mean for this to be exposed?

On the upside, you have such a huge test suite, refactoring your controllers
should be easy.

## assign_attributes

Why this over `update`?

## Overall

It's clearly technically proficient, but some of the engineering efforts are a
bit too far.  There's some spots where you're getting a bit too clever and it's
hurting the overall readability.  i think we'd like to spend some time with you
to clear things up tomorrow a bit.
