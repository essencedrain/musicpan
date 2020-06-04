package com.musicpan.domain;

import lombok.Data;

@Data
public class BoardAttachVO {

  private String b_name;
  private String uuid;
  private String uploadPath;
  private String fileName;
  private boolean fileType;
  
  private Long bno;
  
}
