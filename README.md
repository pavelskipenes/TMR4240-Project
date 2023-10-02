# TMR4240-Project

## Prerequisits

- Matlab minimum required version: 2023b
- Simulink 2023b
- [https://github.com/git-guides/install-git](git) installed
- [https://docs.github.com/en/repositories/working-with-files/managing-large-files/installing-git-large-file-storage](git-lfs) installed and configured

## Project setup

```
git clone https://github.com/pavelskipenes/TMR4240-Project
cd TMR4240-Project
unzip vendor/MSS.zip -d src/
find -name "__MACOSX" -exec rm -r {} \;
```

> Downloading the project using download zip button will exclude blob files like simulink models. Project needs to be cloned using git.

`MSs.zip` is meant to be Marine System Simulator however it does not successfully install in current matlab version so therfore the zip is provided instead. Once the issue is fixed the instructions will be updated.

- open matlab
- navigate to `src`
- add directory and subdirectories to path `src/MSS`
- run `init.m`
- open `part1.slx`
