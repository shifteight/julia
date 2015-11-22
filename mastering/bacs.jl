# A game simulation: Bulls and Cows
function bacs()
    bulls = cows = turns = 0
    A = []
    srand(round(Int,time()))
    while length(unique(A)) < 4
        push!(A, rand('1': '9'))
    end
    bacs_number = unique(A)
    println("Bulls and Cows")
    while (bulls != 4)
        print("Guess? ")
        if eof(STDIN)
            s = "q"
        else
            s = chomp(readline(STDIN))
        end
        if (s == "q")
            print("My guess was ")
            [print(bacs_number[i]) for i = 1:4]
            return
        end
        guess = collect(s)
        if !(length(unique(guess)) == length(guess) == 4 &&
            all(isdigit, guess))
            print("\nEnter four distinct digits or q to quit: ")
            continue
        end
        bulls = sum(map(==, guess, bacs_number))
        cows = length(intersect(guess, bacs_number)) - bulls
        println("$bulls bulls and $cows cows!")
        turns += 1
    end
    println("You guessed my number in $turns turns.")
end