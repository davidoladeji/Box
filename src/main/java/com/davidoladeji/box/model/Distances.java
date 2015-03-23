package com.davidoladeji.box.model;


import javax.xml.bind.annotation.XmlRootElement;
import java.util.List;

/**
 * Created by Daveola on 3/20/2015.
 */

@XmlRootElement(name = "Distances")
public class Distances {


    Distance distance;

    private int count;

    private List<Distance> distances;


    public Distances() {
    }

    public Distances(List<Distance> distances) {
        this.distances = distances;
        this.count = distances.size();
    }

    public Distances(Distance distance) {
        this.distance = distance;
    }

    public List<Distance> getDistances() {

        return distances;
    }

    public void setDistances(List<Distance> distances) {
        this.distances = distances;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }


    public Distance getDistance() {
        return distance;
    }

    public void setDistance(Distance distance) {
        this.distance = distance;
    }


}
