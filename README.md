# NewsBuddy-Dockerfile

Needed a quick Dockerfile to launch newsbuddy quickly, this is awful. I'll improve it later.

You'll need to edit boot.sh and change `tombowditch` to your nickname, you'll also probably want to change `--concurrent`.

Grabbed the base from [the warrior Dockerfile](https://github.com/ArchiveTeam/warrior-dockerfile/blob/master/Dockerfile)

# Setup

Until I add proper environment variables for concurrency and nickname, you'll want to:

1) Clone this repo

`git clone https://github.com/tombowditch/NewsBuddy-Dockerfile.git && cd NewsBuddy-Docker`

2) Edit `boot.sh` and change `tombowditch` (and possibly the concurrency - 20 is the maximum [and very cpu intensive!])

3) Build the image

`docker build -t newsbuddy .`

4) Start 

`docker run -d newsbuddy`
