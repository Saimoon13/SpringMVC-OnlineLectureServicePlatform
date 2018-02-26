package controller;

import domain.Board;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pageutil.PageNumberMaker;
import pageutil.PaginationCriteria;
import service.BoardService;

import java.util.List;

@Controller
@RequestMapping(value="/board")
public class BoardController {
    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Autowired private BoardService boardService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void boardList(Integer page, Integer perPage, Model model) {
        logger.info("page: {}, perPage: {}", page, perPage);

        PaginationCriteria c = null;
        if (page != null && perPage != null) {
            c = new PaginationCriteria(page, perPage);
        } else {
            c = new PaginationCriteria(); // 1, 10
        }
        PageNumberMaker maker = new PageNumberMaker();
        maker.setCriteria(c);
        maker.setTotalCount(boardService.getTotalCount()); // 전체 게시글 수
        maker.setPageMakerData();

        List<Board> list = boardService.select(c); // 한페이지에 보여줄 게시글 리스트
        model.addAttribute("boardList", list);
        model.addAttribute("pageMaker", maker);
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerBoard() {
        logger.info("registerBoard() 호출");
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerBoard(Board b) {
        logger.info("registerBoard() POST 호출");
        logger.info("--- title: " + b.getTitle());
        logger.info("--- content: " + b.getContent());
        logger.info("--- userid: " + b.getUserid());

        boardService.insert(b);

        return "redirect:/board/list";
    }

    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public void update(int bno, Model model) {
        Board b = boardService.select(bno);
        model.addAttribute("board", b);
    }
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Board b) {
        boardService.update(b);

        return "redirect:/board/detail?bno=" + b.getBno();
    }

    @RequestMapping(value = "/detail",
            method = RequestMethod.GET)
    public void detail(int bno, Model model) {
        logger.info("detail() GET 호출");

        Board b = boardService.select(bno);
        logger.info("--- title: {}, userid: {}",
                b.getTitle(), b.getUserid());

        model.addAttribute("board", b);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(int bno) {
        boardService.delete(bno);

        return "redirect:/board/list";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public void search(int searchType, String searchKeyword,
                       Model model) {
        logger.info("type: {}, keyword: {}", searchType, searchKeyword);
        List<Board> list = boardService.search(searchType, searchKeyword);
        model.addAttribute("boardList", list);



    }
}
