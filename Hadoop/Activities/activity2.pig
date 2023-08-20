--Load text file into Pig
inputData = LOAD 'hdfs:///user/nilanjana17maity/input.txt' AS (lines);
--Tokenize line into words (MAP)
words = FOREACH inputData GENERATE FLATTEN(TOKENIZE(lines)) as word;
--Group words by word
grpd = GROUP words BY word;
-- Count the occurence of each word(REDUCE)
totalCount = FOREACH grpd GENERATE group, COUNT(words);
-- Store the result in HDFS
STORE totalCount INTO 'hdfs:///user/nilanjana17maity/activity2Output';
