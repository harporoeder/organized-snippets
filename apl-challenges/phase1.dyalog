⍝ Oh Say Can You See?

visibility←{≢∪⌈⍀⍵}

⍝ Number Splitting

split←{(⌊⍵),⍵-⌊⍵}

⍝ What's Your Sign?

eastern_signs←'Monkey' 'Rooster' 'Dog' 'Pig' 'Rat' 'Ox' 'Tiger' 'Rabbit' 'Dragon' 'Snake' 'Horse' 'Goat'

eastern_year_of←{eastern_signs[(0⌈¯1××⍵)+1+12|⍵]}

⍝ What's Your Sign? Revisited

western_signs←'Aquarius' 'Pisces' 'Aries' 'Taurus' 'Gemini' 'Cancer' 'Leo' 'Virgo' 'Libra' 'Scorpio' 'Sagittarius' 'Capricorn'

western_dates←12 2⍴1 20 2 19 3 21 4 20 5 21 6 21 7 23 8 23 9 23 10 23 11 22 12 22

western_day_of←{western_signs[(1⌈12×∧/⍵≤1 19)⌈+/⍵(∧/≥⍤1)western_dates]}

⍝ What's Your Angle?

bracket_check←{s←(⍵∊'<>')/⍵ ⋄ s≡((⍴s)+2|⍴s)⍴'<>'}

⍝ Unconditionally Shifty

shift←{(⍴⍵)⍴(¯1×⍺)⌽⍵,((|⍺)⌈⍴⍵)⍴0}

⍝ Making a Good Argument

good_arg←{∧/1,((⍳⌈/⍺,0)∊⍺),((⍴⍺,⍬)≡⍴⍴⍵),⍺∊⍳⍴⍴⍵}

⍝ Earlier, Later, or the Same?

compare_time←{c←{(¯1×⍺<⍵)+⍺>⍵} ⋄ v←⍺c⍵ ⋄ ⊣/((v≠0)/v),0}

⍝ Anagrammatically Correct

anagram←{s←{⍵[⍋⍵]} ⋄ f←{(⍵≠' ')/⍵} ⋄ (s f ⍺)≡s f ⍵}
