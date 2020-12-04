rm -rf runapp
mkdir runapp
cp $1/* runapp/
docker build -t runapp .
docker run -it --rm --name aspnetcore_app runapp