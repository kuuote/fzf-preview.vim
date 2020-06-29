import { globalVariableSelector } from "@/module/selector/vim-variable"
import { existsFile } from "@/system/file"
import { readMrwFile } from "@/system/mr"
import type { FzfCommandDefinitionDefaultOption, ResourceLines, SourceFuncArgs } from "@/type"

export const mrwFiles = async (_args: SourceFuncArgs): Promise<ResourceLines> =>
  (await readMrwFile()).filter((file) => existsFile(file))

export const mrwFilesDefaultOptions = (): FzfCommandDefinitionDefaultOption => ({
  "--prompt": '"MrwFiles> "',
  "--multi": true,
  "--preview": `"${globalVariableSelector("fzfPreviewCommand") as string}"`,
})
