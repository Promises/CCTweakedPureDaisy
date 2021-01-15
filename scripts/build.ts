import * as fs from "fs-extra";
import * as path from "path";
import { compileMap, getFilesInDirectory, loadJsonFile, logger, toArrayBuffer, IProjectConfig } from "./utils";

function main() {
  const result = compileMap();

  if (!result) {
    logger.error(`Failed to compile map.`);
    return;
  }

}
main();
