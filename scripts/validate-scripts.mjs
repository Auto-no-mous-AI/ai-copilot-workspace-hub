import { readFileSync } from 'node:fs';

const pkg = JSON.parse(readFileSync(new URL('../package.json', import.meta.url), 'utf8'));
if (!pkg.scripts?.['bootstrap:workspace']) {
  throw new Error('Missing bootstrap:workspace script');
}
if (!pkg.scripts?.['smoke:workspace']) {
  throw new Error('Missing smoke:workspace script');
}
console.log('scripts-ok');
