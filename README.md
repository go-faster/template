# template
Project template

## Untemplate

Easiest way:

```bash
gh repo clone go-faster/template
```

```bash
export NAME=your-project-name
```

```bash
cp -r template "${NAME}"
cd "${NAME}"

rm -rf .git .idea
git init
git commit -m "feat: init repo" --allow-empty

./template.sh
git add .
git commit -m "feat: init project"

gh repo create --source . --public "go-faster/${NAME}"
git push -u origin main
```
