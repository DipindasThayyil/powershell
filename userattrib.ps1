def gitUrl = "hhttps://github.sherwin.com/SW-CORP-IT/sw_tcs_UnixAttributeTask.git"

pipelineJob("Tools and Processes/sw_tcs_UnixAttributeTask") {
	description "update and add user attributes"

	parameters {
		stringParam('targetuser', '', '')
		stringParam('targetGroupName', '', '')
        stringParam('loginShell', '', '')
        stringParam('msSFU30NisDomain', '', '')
        stringParam('unixHomeDirectory', '', '')
        
	}
  definition {
  cpsScm {
	scm {
		git {
			remote {
				url gitUrl
				credentials('jenkins4github')
				scriptPath('Jenkinsfile')
				lightweight(true)
			}
			extensions {
				wipeWorkspace()
				localBranch "master"
			}
			branch "origin/master"
		}
	}
  }
  }
}
