#!/bin/bash
cd tamil-astro-package
npm ci
npm run compile
npm pack
mv tamil-astro*.tgz tamil-astro.tgz