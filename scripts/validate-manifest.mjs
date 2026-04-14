import { readFileSync } from 'node:fs';

const manifest = JSON.parse(readFileSync(new URL('../repos.json', import.meta.url), 'utf8'));
if (!Array.isArray(manifest) || manifest.length !== 8) {
  throw new Error('Expected 8 repositories in repos.json');
}
for (const repo of manifest) {
  if (!repo.name || !repo.url) {
    throw new Error('Each repository entry must include name and url');
  }
}
console.log('manifest-ok');
