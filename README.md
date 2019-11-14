# KimobyChallenge
## The First Challenge

The challenge here is to generate a list of six characters words that are composed of two concatenated words processed from the given dictionary.

The dictionary can be downloaded here: https://drive.google.com/file/d/1U_f1Yt213uKayuoOwD_kErtzNJR8AyCB/view?usp=sharing

For example:

```
de + ploy => deploy
we + aver => weaver
tail + or => tailor
[...]
```
## The Solution

Basically, the solution was to implement a HashMap of List that contains all words of a specific number of characters. If we are searching for words of 6 characters, we will concatenate words than contains enough characters to generate a word of 6 characters. So the HashMap will contains a list of words of 6 characters, a list of words of 4 characters, a list of words of 3 characters and a list of words of 2 characters. For each word in the list of words of 6 characters, we will compare the N first characters with each word in the list of words of N characters. If the N first character of the word are similar to all characters of the word of N characters, we add the word of 6 character in a temporary list. After that, for each word in the temporary list, we will compare the M last characters with each word in the list of words of M characters. If the M last character of the word are similar to all characters of the word of M characters, we add the word of 6 character in the result list. This list contains all the six characters words that are composed of two concatenated words.

## The Second Challenge and the solution

For the second challenge, I've chosen to extend the first problem for words of eight characters instead of six. Basically I've solved the problem with the same solution but the HashMap contains more lists of word; a list of words of 6 characters, a list of words of 6 characters, a list of words of 5 characters, a list of words of 4 characters, a list of words of 3 characters and a list of words of 2 characters.
