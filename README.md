# template
Project template

## Untemplate

Most easy way to create a new project:

```bash
export NAME=your-project-name
gh repo clone go-faster/template
cp -r template "${NAME}"
cd "${NAME}"

rm -rf .git
git init
git commit -m "init" --allow-empty

./template.sh
git add .
git commit -m "feat: init"

gh repo create --source . --public "go-faster/${NAME}"
git push -u origin main
```
