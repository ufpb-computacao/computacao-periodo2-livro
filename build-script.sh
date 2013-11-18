BRANCH=HEAD

L1_DIR=~/asciibook/calculo-diferencial-e-integral-livro/
L1_TAG=HEAD
L2_DIR=~/asciibook/metodologia-do-trabalho-cientifico-livro
L2_TAG=HEAD

rm -rf ~/asciibook/computacao-periodo2-livro/releases/$BRANCH

cd $L1_DIR
git archive --prefix="releases/$BRANCH/" $L1_TAG | tar -x -C ~/asciibook/computacao-periodo2-livro/
cd ~/asciibook/metodologia-do-trabalho-cientifico-livro
git archive --prefix="releases/$BRANCH/" $L2_TAG | tar -x -C ~/asciibook/computacao-periodo2-livro/
cd ~/asciibook/computacao-periodo2-livro/
git archive --prefix="releases/$BRANCH/" $BRANCH | tar -x -C ~/asciibook/computacao-periodo2-livro/
