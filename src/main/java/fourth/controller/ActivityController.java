package fourth.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import fourth.bean.ActivityBean;
import fourth.bean.MemberBean;
import fourth.service.ActivityService;
import fourth.service.MemberService;

@Controller
@RequestMapping("/Activity")
public class ActivityController {

	private final String MapKey_pageSize = "pageSize";
	private final String MapKey_pageNo = "pageNo";
	private final String MapKey_keyWord = "keyWord";

	@Autowired
	private ActivityService activityService;

	// Activity get
	@GetMapping("")
	public String ActivityPreviewUser() {
		return "activity";
	}

	@GetMapping("/Activity-{id}")
	public String updateActivities() {
		// 應插入權限判斷
		return "Activity";
	}
	

	

//	======================================================================================================================================================
//	====================================================API區=============================================================================================
//	======================================================================================================================================================
	// 查詢所有API
	@PostMapping("/titleLike")
	@ResponseBody
	public Page<ActivityBean> selectActivityAll(@RequestBody() Map<String, String> map) {
		Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
		Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));
		String keyWord = map.get(MapKey_keyWord);

		PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);

		Page<ActivityBean> selectAllByTitleLike = activityService.selectActivityByTitleLike(pageable, keyWord);

		return selectAllByTitleLike;
	}
	// 顯示所有
	@PostMapping("/all")
	@ResponseBody
	public Page<ActivityBean> selectActivityAllByTitleLike(@RequestBody() Map<String, String> map) {
		Integer pageNo = Integer.valueOf(map.get(MapKey_pageNo));
		Integer pageSize = Integer.valueOf(map.get(MapKey_pageSize));

		PageRequest pageable = PageRequest.of(pageNo - 1, pageSize);

		Page<ActivityBean> selectAllActivity = activityService.selectAllActivity(pageable);
		return selectAllActivity;
	}
	
	//	查看活動
	@PostMapping("/Activity{id}")
	@ResponseBody
	public ActivityBean selectActivity(@PathVariable Integer id) {
		return activityService.selectActivityById(id);
	}

	// =====================================================================================================

	// ========================================審核========================================================================================

}
