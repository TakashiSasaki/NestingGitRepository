all: clean repo 

clean:
	rm -rf repoA repoB

repo:
	mkdir repoA
	mkdir repoB
	(cd repoA; git init)
	(cd repoB; git init)
	echo "*" >repoA/.gitignore
	echo "*" >repoB/.gitignore

master:
	(cd repoA; touch A; git add --all; git commit -m "touch A in repoA/master")
	(cd repoB; touch B; git add --all; git commit -m "touch B in repoB/master")
	(cd repoA; echo "hello A in repoA/master" >>A; git add --all; git commit -am "hello A in repoA/master")
	(cd repoB; echo "hello B in repoA/master" >>B; git add --all; git commit -am "hello B in repoB/master")
	(cd repoA; echo "hello B in repoA/master" >>B; git add --all; git commit -am "hello B in repoA/master")
	(cd repoB; echo "hello A in repoB/master" >>A; git add --all; git commit -am "hello A in repoB/master")

orphan:
	(cd repoA; git checkout --orphan orphan; git add --all; git commit -am "begin repoA/orphan")
	(cd repoB; git checkout --orphan orphan; git add --all; git commit -am "begin repoB/orphan")
	(cd repoA; echo "hello A in repoA/orphan" >A; git add --all; git commit -am "hello A in repoA/orphan")
	(cd repoB; echo "hello B in repoA/orphan" >B; git add --all; git commit -am "hello B in repoB/orphan")

fetch:
	(cd repoA; git fetch ../repoB)
	(cd repoB; git fetch ../repoA)

