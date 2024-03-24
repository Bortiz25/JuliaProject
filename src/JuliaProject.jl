module JuliaProject

function vigenere_encrypt(key::String, plaintext::String)
    key = uppercase(replace(key, r"[^a-zA-Z]" => ""))
    plaintext = join(split(plaintext, " "))
    formatplaintext = uppercase(replace(plaintext, r"[^a-zA-Z]" => ""))
    println(formatplaintext)
    key_length = length(key)
    key_repeated = join([key[i % key_length == 0 ? key_length : i % key_length] for i in 1:length(formatplaintext)])

    encrypted_text = ""
    for (p, k) in zip(formatplaintext, key_repeated)
        shift = mod1(Int(p) + Int(k) - 2 * Int('A'), 26)
        encrypted_text *= Char(shift + Int('A'))
    end

    return encrypted_text
end

function vigenere_decrypt(key::String, ciphertext::String)
    key = uppercase(replace(key, r"[^a-zA-Z]" => ""))
    ciphertext = uppercase(replace(join(split(ciphertext, " ")), r"[^a-zA-Z]" => ""))

    key_length = length(key)
    key_repeated = join([key[i % key_length == 0 ? key_length : i % key_length] for i in 1:length(ciphertext)])

    decrypted_text = ""
    for (c, k) in zip(ciphertext, key_repeated)
        shift = mod1(Int(c) - Int(k), 26)
        decrypted_text *= Char(shift == 0 ? 26 : shift + Int('A'))
    end

    return decrypted_text
end


# Example values

key = "KEY"
plaintext = "HELLO WORLD"
encrypted_text = vigenere_encrypt(key, plaintext)
decrypted_text = vigenere_decrypt(key, encrypted_text)

println("Plaintext:", plaintext)
println("Key:", key)
println("Encrypted text:", encrypted_text)
println("Decrypted text:", decrypted_text)


end # module JuliaProject