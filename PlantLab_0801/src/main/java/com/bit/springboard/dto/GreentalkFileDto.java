package com.bit.springboard.dto;

public class GreentalkFileDto {
    private int id;
    private String filename;
    private String fileoriginname;
    private String filepath;
    private String filetype;
    private String filestatus;
    private String newfilename;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFileoriginname() {
        return fileoriginname;
    }

    public void setFileoriginname(String fileoriginname) {
        this.fileoriginname = fileoriginname;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getFiletype() {
        return filetype;
    }

    public void setFiletype(String filetype) {
        this.filetype = filetype;
    }

    public String getFilestatus() {
        return filestatus;
    }

    public void setFilestatus(String filestatus) {
        this.filestatus = filestatus;
    }

    public String getNewfilename() {
        return newfilename;
    }

    public void setNewfilename(String newfilename) {
        this.newfilename = newfilename;
    }

    @Override
    public String toString() {
        return "GreentalkFileDto{" +
                "id=" + id +
                ", filename='" + filename + '\'' +
                ", fileoriginname='" + fileoriginname + '\'' +
                ", filepath='" + filepath + '\'' +
                ", filetype='" + filetype + '\'' +
                ", filestatus='" + filestatus + '\'' +
                ", newfilename='" + newfilename + '\'' +
                '}';
    }
}
