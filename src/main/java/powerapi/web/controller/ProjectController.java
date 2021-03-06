package powerapi.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import powerapi.common.Constants;
import powerapi.common.anno.LogDelete;
import powerapi.common.anno.LogModify;
import powerapi.common.utils.JsonUtil;
import powerapi.entity.Module;
import powerapi.entity.Project;
import powerapi.service.ModuleService;

@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

    @Autowired
    private ModuleService moduleService;

    /**
     * 根据页码获取项目列表
     * 根据创建时间倒排
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/all", method = RequestMethod.POST)
    public String list() {
        List<Project> projects = projectService.getProjectList(getCurrentUser().getId());
        return JsonUtil.getInstance().setList(projects).result();
    }

    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String listview() {
        return "project/index";
    }

    /**
     * 新增项目
     *
     * @return
     */
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create() {
        return "project/create";
    }

    /**
     * 编辑项目
     *
     * @param project
     * @return
     */
    @LogModify(resource = Constants.LOG_RESOURCE_PROJECT)
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Project project) {
        project.setUserId(getCurrentUser().getId());
        projectService.modifyProject(project);
        return "redirect:/project/all";
    }

    /**
     * 详情
     *
     * @param model
     * @param id
     * @return
     */

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(ModelMap model, @RequestParam(value = "id", required = true) Long id) {
        model.addAttribute("project", getProject(id));
        return "project/detail";
    }

    /**
     * 删除
     *
     * @return
     */
    @LogDelete(resource = Constants.LOG_RESOURCE_PROJECT)
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(Project project) {
        project.setTitle(projectService.findProjectById(project.getId()).getTitle());
        projectService.deleteProject(project.getId());
        return "redirect:/project/all";
    }

    /**
     * 预览项目文档
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/preview", method = RequestMethod.GET)
    public String preview(ModelMap model, @RequestParam(value = "id", required = true) Long id) {
        List<Module> modules = moduleService.selectByProjectId(id);
        model.addAttribute("modules", modules);
        model.addAttribute("project", getProject(id));
        return "project/preview";
    }

}
