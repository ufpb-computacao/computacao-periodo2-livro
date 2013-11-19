BRANCH=HEAD
REPOSITORIO_PATH=`git rev-parse --show-toplevel`
SEJDA_BIN="/home/santana/ambiente/sejda/bin/sejda-console"

L1_DIR=~/asciibook/calculo-diferencial-e-integral-livro/
L1_TAG=HEAD
L2_DIR=~/asciibook/metodologia-do-trabalho-cientifico-livro
L2_TAG=HEAD

rm -rf $REPOSITORIO_PATHreleases/$BRANCH

# TODO: Notificar substituições de arquivos no extract

cd $L1_DIR
git pull
git archive --prefix="releases/$BRANCH/" $L1_TAG | tar x -C $REPOSITORIO_PATH
cd $L2_DIR
git pull
git archive --prefix="releases/$BRANCH/" $L2_TAG | tar x -C $REPOSITORIO_PATH

cd $REPOSITORIO_PATH
git pull
git archive --prefix="releases/$BRANCH/" $BRANCH | tar -vx -C $REPOSITORIO_PATH

cd $REPOSITORIO_PATH
~/ambiente/asciidoc-8.6.8/a2x.py -v -f pdf --icons -a docinfo1 -a lang=pt-BR -d book --dblatex-opts "-T computacao -P latex.babel.language=brazilian"  -a livro-pdf releases/$BRANCH/livro/livro.asc > releases/$BRANCH/livro/log.txt
cat releases/$BRANCH/livro/log.txt

if [ -f releases/$BRANCH/livro/editora/editora.pdf ]
then
  echo "Adicionando editora.pdf..."
  mv releases/$BRANCH/livro/livro.pdf releases/$BRANCH/livro/temp.pdf
  $SEJDA_BIN merge -f releases/$BRANCH/livro/editora/editora.pdf releases/$BRANCH/livro/temp.pdf -o releases/$BRANCH/livro/livro.pdf
fi


if [ -f releases/$BRANCH/livro/editora.pdf ]
  then
    echo apending
fi

